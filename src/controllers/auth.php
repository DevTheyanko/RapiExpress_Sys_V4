<?php

use RapiExpress\Models\Auth;

session_start();

function auth_login() {
    $error = '';

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $Username = trim($_POST['Username']);
        $password = trim($_POST['Password']);

        if (!empty($Username) && !empty($password)) {
            $authModel = new Auth(); // Usamos Auth aquí
            $usuario = $authModel->autenticar($Username, $password);

            if ($usuario) {
                $_SESSION['usuario'] = $usuario['Username'];
                $_SESSION['nombre_completo'] = $usuario['Nombres_Usuario'] . ' ' . $usuario['Apellidos_Usuario'];
                header('Location: index.php?c=dashboard&a=index');
                exit();
            } else {
                $error = "Credenciales inválidas.";
            }
        } else {
            $error = "Por favor, completa todos los campos.";
        }
    }

    include __DIR__ . '/../views/auth/login.php';
}

function auth_recoverPassword() {
    $error = '';
    $success = '';

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $username = trim($_POST['Username'] ?? '');
        $newPassword = trim($_POST['Password'] ?? '');

        if (!empty($username) && !empty($newPassword)) {
            $authModel = new Auth();
            $resultado = $authModel->recuperarPassword($username, $newPassword);

            if ($resultado === true) {
                $success = "Contraseña actualizada correctamente. Puedes iniciar sesión con tu nueva contraseña.";
            } elseif ($resultado === 'no_encontrado') {
                $error = "Usuario no encontrado.";
            } else {
                $error = "Error al actualizar la contraseña.";
            }
        } else {
            $error = "Por favor, completa todos los campos.";
        }
    }

    include __DIR__ . '/../views/auth/recoverpassword.php';
}

function auth_logout() {
    session_start();
    session_unset();
    session_destroy();
    header('Location: index.php?c=auth&a=login');
    exit();
}
