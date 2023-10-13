<?php
    include "./database/conexion.php"; 
    $consulta=$DB_con->prepare('SELECT * FROM categoria');
    $consulta->execute();
    $categorias=$consulta->fetchAll(PDO::FETCH_ASSOC);
?>

<header class="over-flow-hidden" style="height: 85px;">
    <!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-transparent">
  <div class="container">
    <a class="navbar-brand" href="#">QuibdóSolar</a>
    <button class="navbar-toggler shadow-none border-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="sidebar offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header text-white border-bottom">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">QuibdóSolar</h5>
        <button type="button" class="btn-close btn-close-white shadow-none" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-center align-items-center fs-5 flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="./index.php">Inicio</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#"  role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Tienda
              </a>
              <div class="transparente">
                <div class="dropdown-menu">
                  <?php
                    foreach ($categorias as $key => $categoria) {
                      if ($categoria["estado_categoria"]==1){
                  ?>
                    <ul>
                      <li><a class="dropdown-item" href="./paginaCategoria.php?id=<?php echo $categoria['id_categoria'] ?>"><?php echo $categoria['categoria'] ?></a>
                      </li>
                    </ul>
                  <?php
                    } else {
                       continue;
                      }
                       }
                   ?>
                </div>
              </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./nosotros.php">Nosotros</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./cotizaciones.php">Cotizaciones</a>
          </li>
          <li class="nav-item"><a href="./mostrarCarritoIndex.php"
              class="nav-link">Carrito(<?php echo (empty($_SESSION['carritoIndex']))?0:count($_SESSION['carritoIndex']); ?>)</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./blogs.php">Blog</a>
          </li>
        </ul>
        <!-- sign up/ login -->
        <div class="d-flex flex-column flex-lg-row justify-content-center align-items-center gap-3">
            <a href="./login-registro.php" class="text-white text-decoration-none px-3 py-1 rounded-4" style="background-color:#2ECC71;">Inicio Sesion</a>
        </div>
      </div>
    </div>
  </div>
</nav>
</header>
