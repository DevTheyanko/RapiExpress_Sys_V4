<?php
namespace RapiExpress\Models;

use PDO;
use PDOException;
use RapiExpress\Config\Conexion;
use RapiExpress\Interface\ISucursalModel;

class Sucursal extends Conexion implements ISucursalModel
{
    private string $lastError = '';

    public function registrar(array $data): string
    {
        try {
            if ($this->existeRIF($data['RIF_Sucursal'])) {
                return 'rif_existente';
            }

            if ($this->existeCorreo($data['Sucursal_Correo'])) {
                return 'correo_existente';
            }

            $stmt = $this->db->prepare("
                INSERT INTO sucursales (RIF_Sucursal, Sucursal_Nombre, Sucursal_Direccion, Sucursal_Telefono, Sucursal_Correo)
                VALUES (?, ?, ?, ?, ?)
            ");

            $resultado = $stmt->execute([
                $data['RIF_Sucursal'],
                $data['Sucursal_Nombre'],
                $data['Sucursal_Direccion'],
                $data['Sucursal_Telefono'],
                $data['Sucursal_Correo']
            ]);

            return $resultado ? 'registro_exitoso' : 'error_registro';

        } catch (PDOException $e) {
            $this->lastError = $e->getMessage();
            error_log("Error en registro sucursal: " . $e->getMessage());
            return 'error_bd';
        }
    }

    public function obtenerTodas(): array
    {
        try {
            $stmt = $this->db->query("SELECT * FROM sucursales ORDER BY ID_Sucursal DESC");
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            $this->lastError = $e->getMessage();
            error_log("Error al obtener sucursales: " . $e->getMessage());
            return [];
        }
    }

    public function obtenerPorId(int $id): ?array
    {
        try {
            $stmt = $this->db->prepare("SELECT * FROM sucursales WHERE ID_Sucursal = ?");
            $stmt->execute([$id]);
            return $stmt->fetch(PDO::FETCH_ASSOC) ?: null;
        } catch (PDOException $e) {
            $this->lastError = $e->getMessage();
            error_log("Error al obtener sucursal por ID: " . $e->getMessage());
            return null;
        }
    }

    public function actualizar(array $data): bool|string
    {
        try {
            if ($this->existeRIFEnOtraSucursal($data['RIF_Sucursal'], $data['ID_Sucursal'])) {
                return 'rif_existente';
            }

            if ($this->existeCorreoEnOtraSucursal($data['Sucursal_Correo'], $data['ID_Sucursal'])) {
                return 'correo_existente';
            }

            $stmt = $this->db->prepare("
                UPDATE sucursales
                SET RIF_Sucursal = ?, Sucursal_Nombre = ?, Sucursal_Direccion = ?, Sucursal_Telefono = ?, Sucursal_Correo = ?
                WHERE ID_Sucursal = ?
            ");

            return $stmt->execute([
                $data['RIF_Sucursal'],
                $data['Sucursal_Nombre'],
                $data['Sucursal_Direccion'],
                $data['Sucursal_Telefono'],
                $data['Sucursal_Correo'],
                $data['ID_Sucursal']
            ]);
        } catch (PDOException $e) {
            $this->lastError = $e->getMessage();
            error_log("Error al actualizar sucursal: " . $e->getMessage());
            return false;
        }
    }

    public function eliminar(int $id): bool
    {
        try {
            $stmt = $this->db->prepare("DELETE FROM sucursales WHERE ID_Sucursal = ?");
            return $stmt->execute([$id]);
        } catch (PDOException $e) {
            $this->lastError = $e->getMessage();
            error_log("Error al eliminar sucursal: " . $e->getMessage());
            return false;
        }
    }

    private function existeRIF(string $rif): bool
    {
        $stmt = $this->db->prepare("SELECT ID_Sucursal FROM sucursales WHERE RIF_Sucursal = ?");
        $stmt->execute([$rif]);
        return (bool) $stmt->fetch();
    }

    private function existeRIFEnOtraSucursal(string $rif, int $idSucursal): bool
    {
        $stmt = $this->db->prepare("SELECT ID_Sucursal FROM sucursales WHERE RIF_Sucursal = ? AND ID_Sucursal != ?");
        $stmt->execute([$rif, $idSucursal]);
        return (bool) $stmt->fetch();
    }

    private function existeCorreo(string $correo): bool
    {
        $stmt = $this->db->prepare("SELECT ID_Sucursal FROM sucursales WHERE Sucursal_Correo = ?");
        $stmt->execute([$correo]);
        return (bool) $stmt->fetch();
    }

    private function existeCorreoEnOtraSucursal(string $correo, int $idSucursal): bool
    {
        $stmt = $this->db->prepare("SELECT ID_Sucursal FROM sucursales WHERE Sucursal_Correo = ? AND ID_Sucursal != ?");
        $stmt->execute([$correo, $idSucursal]);
        return (bool) $stmt->fetch();
    }

    public function getLastError(): string
    {
        return $this->lastError;
    }
}
