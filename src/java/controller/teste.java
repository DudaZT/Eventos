package controller;
import java.math.BigInteger;
import java.security.MessageDigest;

public class teste {
    public static void main(String[] args) {
        try {
            int userId = 1;
            String senha = "admin";
            
            String hash = gerarHash(userId, senha);
            
            System.out.println("=== GERADOR DE HASH ===");
            System.out.println("ID do usuário: " + userId);
            System.out.println("Senha escolhida: " + senha);
            System.out.println("Hash gerado: " + hash);
            
            System.out.println("\n=== COMANDO SQL PARA EXECUTAR ===");
            System.out.println("DELETE FROM usuarios WHERE id = 1;");
            System.out.println("INSERT INTO usuarios (id, nome, email, senha, privilegios_id) VALUES (1, 'Administrador', 'admin@gmail.com', '" + hash + "', 1);");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static String gerarHash(int userId, String senha) throws Exception {

        String senhaSal = userId + senha + userId / 2;
        
        MessageDigest md = MessageDigest.getInstance("SHA-512");
        byte[] hashBytes = md.digest(senhaSal.getBytes("UTF-8"));
        
        String hash = new BigInteger(1, hashBytes).toString(16);
        
        return hash;
    }
}
