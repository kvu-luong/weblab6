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
public class Counter {
    int count = 0;
    public Counter(){
        
    }
    //this method to get value
    public int getCount(){
        count++;
        return this.count;
    }
    //this method reset count value
    public void setCount(int counter){
        this.count = count;
    }
}
