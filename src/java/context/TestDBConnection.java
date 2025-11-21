/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.SQLException;
public class TestDBConnection {
    public static void main(String[] args){
        Connection conn=null;
        System.out.println("Bat dau kiem tra ket noi: ");
        try{
            conn=DBcontext.getConnection();
            if(conn!=null){
               System.out.println("ket noi thanh cong");
            }else {
               System.out.println("ket noi that bai: ");
            }
        }catch(Exception e){
            e.printStackTrace();
         }finally{
            if(conn!=null){
                try{
                    conn.close();
                    System.out.println("Da dong ket noi: ");
                }catch(SQLException e){
                    e.printStackTrace();
                }
            }
        }
    }
}