<?php
$doc = new DOMDocument();
$doc->load("api.xml");
$entries = $doc->getElementsByTagName("entry");

foreach ($entries as $entry) {
    if ($entry->attributes->getNamedItem('type')->value == "method") {
        $funcName  = $entry->attributes->getNamedItem('name')->value;

        $splitFunc = explode(".", $funcName);

        $ffiParts = array();
        $ffiParts[] = "foreign import jscript \"";

        $filteredArgs = array();

        if (count($splitFunc) > 1) {
            $ns = array_shift($splitFunc);
            $filteredArgs[] = ucfirst($ns);
        } else {
            $filteredArgs[] = "JQuery";
        }

        $ffiParts[] = "%1.";

        $arguments = $entry->getElementsByTagName("argument");
        
        foreach ($arguments as $argument) {
            if (!isset($filteredArgs[$argument->attributes->getNamedItem('name')->value . $argument->attributes->getNamedItem('type')->value])) {
                $filteredArgs[] = ucfirst($argument->attributes->getNamedItem('type')->value);
            }
        }

        $return = ucfirst($entry->attributes->getNamedItem("return")->value);
        
        if (!empty($return)) {
            $filteredArgs[] = $return;
        } else {
            // Or JQuery?
            $filteredArgs[] = "IO ()";
        }

        $ffiParts[] = implode($splitFunc, "");

        if (count($filteredArgs) > 1) {
            $ffiParts[] = "(%*)\" ";
        } else {
            $ffiParts[] = "()\" ";
        }
        
        $ffiParts[] = implodeUcfirst($splitFunc) . " :: " . implode(" -> ", $filteredArgs);

        printFFIParts($ffiParts);
    }
}

function printFFIParts(array $parts) {
    echo implode("", $parts) . PHP_EOL;
}

function implodeUcfirst(array $parts) {
    $res = array_shift($parts);

    foreach ($parts as $part) {
        $res .= ucfirst($part);
    }

    return $res;
}
