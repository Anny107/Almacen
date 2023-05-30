<?php

require_once '../vendor/autoload.php';
require_once '../models/registro.php';

use Spipu\Html2Pdf\Html2Pdf;
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;

try {

  //Instanciar clase superhero
    $registro = new Registro();
    $datos= $registro->listarMovimientos($_GET['fecha']);
    //$titulo = $_GET['titulo'];

    ob_start();

    //Archivos que componen PDF
    //Hoja de estilos
    //include './estilos.report.html';
    //Archivos con satos (estaticos/dinamicos)
    include './almacen.data.php';

    $content = ob_get_clean();

    $html2pdf = new Html2Pdf('P', 'A4', 'es');
    $html2pdf->writeHTML($content);
    $html2pdf->output('Registro del dia.pdf');
} catch (Html2PdfException $e) {
    $html2pdf->clean();

    $formatter = new ExceptionFormatter($e);
    echo $formatter->getHtmlMessage();
}