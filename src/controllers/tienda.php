<?php

use RapiExpress\Models\Tienda;
use RapiExpress\Interface\ITiendaModel;

function tienda_index() {
    if (!isset($_SESSION['usuario'])) {
        header('Location: index.php');
        exit();
    }

    $tiendaModel = new Tienda();
    $tiendas = $tiendaModel->obtenerTodas();
    include __DIR__ . '/../views/tienda/tienda.php';
}

function tienda_registrar() {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        session_start();
        $tiendaModel = new Tienda();

        $data = [
            'nombre_tienda' => trim($_POST['nombre_tienda']),
            'direccion_tienda' => trim($_POST['direccion_tienda']),
            'telefono_tienda' => trim($_POST['telefono_tienda']),
            'correo_tienda' => trim($_POST['correo_tienda']),
        ];

        $resultado = $tiendaModel->registrar($data);

        switch ($resultado) {
            case 'registro_exitoso':
                $_SESSION['mensaje'] = 'Tienda registrada exitosamente';
                $_SESSION['tipo_mensaje'] = 'success';
                break;
            case 'error_bd':
                $_SESSION['mensaje'] = 'Error al registrar la tienda';
                $_SESSION['tipo_mensaje'] = 'error';
                break;
            default:
                $_SESSION['mensaje'] = 'Error desconocido';
                $_SESSION['tipo_mensaje'] = 'error';
        }

        header('Location: index.php?c=tienda');
        exit();
    }
}

function tienda_editar() {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        session_start();
        $tiendaModel = new Tienda();

        $required = ['id_tienda', 'nombre_tienda', 'direccion_tienda', 'telefono_tienda', 'correo_tienda'];
        foreach ($required as $field) {
            if (empty($_POST[$field])) {
                $_SESSION['mensaje'] = "Error: El campo $field es requerido";
                $_SESSION['tipo_mensaje'] = 'error';
                header('Location: index.php?c=tienda');
                exit();
            }
        }

        $data = [
            'id_tienda' => (int)$_POST['id_tienda'],
            'nombre_tienda' => trim($_POST['nombre_tienda']),
            'direccion_tienda' => trim($_POST['direccion_tienda']),
            'telefono_tienda' => trim($_POST['telefono_tienda']),
            'correo_tienda' => trim($_POST['correo_tienda']),
        ];

        $resultado = $tiendaModel->actualizar($data);

        if ($resultado) {
            $_SESSION['mensaje'] = 'Tienda actualizada exitosamente';
            $_SESSION['tipo_mensaje'] = 'success';
        } else {
            $_SESSION['mensaje'] = 'Error al actualizar la tienda';
            $_SESSION['tipo_mensaje'] = 'error';
        }

        header('Location: index.php?c=tienda');
        exit();
    }
}

function tienda_eliminar() {
    session_start();

    if (isset($_POST['id_tienda'])) {
        $id = $_POST['id_tienda'];
        $tiendaModel = new Tienda();

        $eliminado = $tiendaModel->eliminar($id);

        if ($eliminado) {
            $_SESSION['mensaje'] = "Tienda eliminada correctamente.";
            $_SESSION['tipo_mensaje'] = "success";
        } else {
            $_SESSION['mensaje'] = "Error al eliminar la tienda.";
            $_SESSION['tipo_mensaje'] = "danger";
        }
    } else {
        $_SESSION['mensaje'] = "ID de tienda no proporcionado.";
        $_SESSION['tipo_mensaje'] = "danger";
    }

    header("Location: index.php?c=tienda");
    exit();
}

function tienda_obtenerTienda() {
    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        $tiendaModel = new Tienda();

        $tienda = $tiendaModel->obtenerPorId($id);
        header('Content-Type: application/json');
        echo json_encode($tienda);
        exit();
    }
}
?>
