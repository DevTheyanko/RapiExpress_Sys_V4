<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <title>RapiExpress - Recuperar Contraseña</title>
    <link rel="icon" href="assets\img\logo-rapi.ico" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    
    <!-- CSS -->
     <link rel="stylesheet" href="assets/css/password-validation.css" />
    <link rel="stylesheet" href="vendor/twbs/bootstrap/css/core.css" />
    <link rel="stylesheet" href="vendor/twbs/bootstrap/css/icon-font.min.css" />
    <link rel="stylesheet" href="vendor/twbs/bootstrap/css/style.css" />   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="login-page">

    <div class="login-header box-shadow">
        <div class="container-fluid d-flex justify-content-between align-items-center">
            <div class="brand-logo">
                <a href="#"><img src="assets/img/logo.png" alt="RapiExpress Logo" /></a>
            </div>
        </div>
    </div>
<?php if (!empty($error)): ?>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: <?= json_encode($error, JSON_UNESCAPED_UNICODE) ?>,
                confirmButtonColor: '#d33'
            });
        });
    </script>
<?php elseif (!empty($success)): ?>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            Swal.fire({
                icon: 'success',
                title: 'Éxito',
                text: <?= json_encode($success, JSON_UNESCAPED_UNICODE) ?>,
                confirmButtonColor: '#3085d6'
            });
        });
    </script>
<?php endif; ?>

    <div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 col-lg-7">
                    <img src="assets/img/login-page-img.png" alt="Imagen de login" />
                </div>
                <div class="col-md-6 col-lg-5">
    <div class="login-box bg-white box-shadow border-radius-10">
        <div class="login-title">
            <h2 class="text-center text-primary">Recuperar Contraseña</h2>
        </div>

       


        <form method="POST" action="index.php?c=auth&a=recoverPassword">
            
            <div class="input-group custom">
                <input type="text" name="Username" class="form-control form-control-lg" placeholder="Usuario" required>
                <div class="input-group-append custom">
                    <span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
                </div>
            </div>
         <div class="input-group custom mb-4">
    <input name="Password" type="password" class="form-control form-control-lg password-input" placeholder="Contraseña" required>
    <div class="input-group-append custom toggle-password" style="cursor: pointer;">
      <span class="input-group-text"><i class="fa fa-eye"></i></span>
    </div>
  </div>
            
            <div class="row pb-30">
                <div class="col-6">
                    <div class="forgot-password"></div>
                </div>                
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="input-group mb-0">
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Restablecer Contraseña</button>
                    </div>
                    <div class="font-16 weight-600 pt-10 pb-10 text-center" data-color="#707373">O</div>
                    <div class="input-group mb-0">
                        <a href="index.php?c=auth&a=login" class="btn btn-outline-primary btn-lg btn-block">Volver al login</a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
            </div>
        </div>
    </div>

    <!-- JS -->
          <script src="assets\js\sweetalert2.js"></script>

    <script src="assets/js/password-validation.js"></script>
    <script src="assets/js/password_view.js"></script>
    <script src="vendor/twbs/bootstrap/js/core.js"></script>
    <script src="vendor/twbs/bootstrap/js/script.min.js"></script>
    <script src="vendor/twbs/bootstrap/js/layout-settings.js"></script>
    <script src="assets/js/script.js"></script>
</body>
</html>