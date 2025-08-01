<?php
namespace RapiExpress\Config;

use PDO;
use PDOException;
use RapiExpress\Interface\IConexion;

abstract class Conexion extends PDO implements IConexion {
    protected $db;

    public function __construct() {
        $this->inicializarConexion();
    }

    public function inicializarConexion(): void {
        $host = 'localhost';
        $dbname = 'rapiexpress_db';
        $username = 'root';
        $password = '';
        $charset = 'utf8mb4';

        $dsn = "mysql:host=$host;dbname=$dbname;charset=$charset";

        try {
            $this->db = new PDO($dsn, $username, $password);
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            throw new \RuntimeException("Error al conectar con la base de datos: " . $e->getMessage());
        }
    }

    public function verificarEstructura(): bool {
        try {
            $stmt = $this->db->query("SHOW TABLES LIKE 'usuarios'");
            return $stmt->rowCount() > 0;
        } catch (PDOException $e) {
            return true;
        }
    }
}


