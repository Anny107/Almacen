<h1 class="text-md text-center"><?=$titulo?></h1>

<table class="table table-border mt-3">
  <colgroup>
    <col style='width: 5%'>
    <col style='width: 15%'>
    <col style='width: 18%'>
    <col style='width: 15%'>
    <col style='width: 10%'>
    <col style='width: 25%'>
    <col style='width: 12%'>
  </colgroup>
  <thead>
    <tr>
      <th>ID</th>
      <th>Tipo</th>
      <th>Descripcion</th>
      <th>Movimientos</th>
      <th>Cantidad</th>
      <th>Observaciones</th>
      <th>Usuario</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach($datos as $registro): ?>
      <tr>
        <td><?=$registro['idmovimiento']?></td>
        <td><?=$registro['tipoprenda']?></td>
        <td><?=$registro['descripcion']?></td>
        <td><?=$registro['tipo']?></td>
        <td><?=$registro['cantidad']?></td>
        <td><?=$registro['observaciones']?></td>
        <td><?=$registro['nombres']?></td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>