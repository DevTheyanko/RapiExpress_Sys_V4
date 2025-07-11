<?php
namespace RapiExpress\Models;
use PDO;
use PDOException;
use RapiExpress\Config\Conexion;
use RapiExpress\Interface\ITiendaModel;

class Tienda extends Conexion implements ITiendaModel
{
    public function registrar(array $data): string
    {
        try {
            $stmt = $this->db->prepare("INSERT INTO tiendas (Tienda_Nombre, Tienda_Direccion, Tienda_Telefono, Tienda_Correo) VALUES (?, ?, ?, ?)");
            $resultado = $stmt->execute([
                $data['nombre_tienda'],
                $data['direccion_tienda'],
                $data['telefono_tienda'],
                $data['correo_tienda']
            ]);

            return $resultado ? 'registro_exitoso' : 'error_bd';

        } catch (PDOException $e) {
            error_log("Error en registro tienda: " . $e->getMessage());
            return 'error_bd';
        }
    }

    public function obtenerTodas(): array
    {
        try {
            $stmt = $this->db->prepare("SELECT * FROM tiendas ORDER BY ID_Tienda DESC");
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            error_log("Error al obtener todas las tiendas: " . $e->getMessage());
            return [];
        }
    }

    public function obtenerPorId(int $id): ?array
    {
        try {
            $stmt = $this->db->prepare("SELECT * FROM tiendas WHERE ID_Tienda = ?");
            $stmt->execute([$id]);
            return $stmt->fetch(PDO::FETCH_ASSOC) ?: null;
        } catch (PDOException $e) {
            error_log("Error al obtener tienda por ID: " . $e->getMessage());
            return null;
        }
    }

    public function actualizar(array $data): bool
    {
        try {
            $stmt = $this->db->prepare("UPDATE tiendas SET Tienda_Nombre = ?, Tienda_Direccion = ?, Tienda_Telefono = ?, Tienda_Correo = ? WHERE ID_Tienda = ?");
            return $stmt->execute([
                $data['nombre_tienda'],
                $data['direccion_tienda'],
                $data['telefono_tienda'],
                $data['correo_tienda'],
                $data['id_tienda']
            ]);
        } catch (PDOException $e) {
            error_log("Error al actualizar tienda: " . $e->getMessage());
            return false;
        }
    }

    public function eliminar(int $id): bool
    {
        try {
            $stmt = $this->db->prepare("DELETE FROM tiendas WHERE ID_Tienda = ?");
            return $stmt->execute([$id]);
        } catch (PDOException $e) {
            error_log("Error al eliminar tienda: " . $e->getMessage());
            return false;
        }
    }
}
?>
