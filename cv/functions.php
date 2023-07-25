<?php

function embed_svg_element($svgFilePath)
{
    try {
        // Check if the file exists
        if (!file_exists($svgFilePath)) {
            throw new Exception('SVG file not found.');
        }

        // Read the SVG content from the file
        $svgContent = file_get_contents($svgFilePath);

        // Return the complete SVG element
        return $svgContent;
    }
    catch (Exception $e) {
        // If an exception is caught, return an error message
        return '<p>Error: ' . htmlspecialchars($e->getMessage()) . '</p>';
    }
}
