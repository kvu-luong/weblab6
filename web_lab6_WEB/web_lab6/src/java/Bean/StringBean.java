/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author ASUS
 */
public class StringBean {
    private String message = "No message specified";
    private int total=0;
    
    public String getMessage(){
        return(message);
    }
    
    public void setMessage(String message){
        this.message = message;
    }
    public String getTotal(){
        return "Total: "+this.total;
    }
    public int addValue(int a, int b){
        int total= a+ b;
        return total;
    }
    public void setTotal(int total){
        this.total = total;
        
    }
}
