package model;

import java.util.ArrayList;
import java.util.List;

public class Product {
    private int id;
    private String product_title, more_infor_product, cpu, ram, storage, gpu, screen, battery, audio, ports, wireless, weight, color, conditionn, warranty;
    private double product_price;
    private int amount_of_product;
    private List<String> images;

    public Product() {
        this.images = new ArrayList<>();
    }

    
    
    
    // Constructor 18 tham số (dùng cho getAllProducts)
    public Product(int id, String product_title, double product_price, int amount_of_product, String more_infor_product,
                   String cpu, String ram, String storage, String gpu, String screen, String battery, String audio,
                   String ports, String wireless, String weight, String color, String conditionn, String warranty) {
        this.id = id;
        this.product_title = product_title != null ? product_title : "";
        this.product_price = product_price;
        this.amount_of_product = amount_of_product;
        this.more_infor_product = more_infor_product != null ? more_infor_product : "";
        this.cpu = cpu != null ? cpu : "";
        this.ram = ram != null ? ram : "";
        this.storage = storage != null ? storage : "";
        this.gpu = gpu != null ? gpu : "";
        this.screen = screen != null ? screen : "";
        this.battery = battery != null ? battery : "";
        this.audio = audio != null ? audio : "";
        this.ports = ports != null ? ports : "";
        this.wireless = wireless != null ? wireless : "";
        this.weight = weight != null ? weight : "";
        this.color = color != null ? color : "";
        this.conditionn = conditionn != null ? conditionn : "";
        this.warranty = warranty != null ? warranty : "";
        this.images = new ArrayList<>(); 
    }
    public Product(int id, String product_title, double product_price, int amount_of_product, String more_infor_product,
                   String cpu, String ram, String storage, String gpu, String screen, String battery, String audio,
                   String ports, String wireless, String weight, String color, String conditionn, String warranty,
                   List<String> images) {
        this.id = id;
        this.product_title = product_title;
        this.product_price = product_price;
        this.amount_of_product = amount_of_product;
        this.more_infor_product = more_infor_product;
        this.cpu = cpu;
        this.ram = ram;
        this.storage = storage;
        this.gpu = gpu;
        this.screen = screen;
        this.battery = battery;
        this.audio = audio;
        this.ports = ports;
        this.wireless = wireless;
        this.weight = weight;
        this.color = color;
        this.conditionn = conditionn;
        this.warranty = warranty;
        this.images = (images != null) ? new ArrayList<>(images) : new ArrayList<>();
    }

  
    public int getId() { return id; }
    public String getProduct_title() { return this.product_title; }
    public double getProduct_price() { return this.product_price; }
    public int getAmount_of_product() { return this.amount_of_product; }
    public String getMore_infor_product() { return this.more_infor_product; }
    public String getCpu() { return this.cpu; }
    public String getRam() { return this.ram; }
    public String getStorage() { return this.storage; }
    public String getGpu() { return this.gpu; }
    public String getScreen() { return this.screen; }
    public String getBattery() { return this.battery; }
    public String getAudio() { return this.audio; }
    public String getPorts() { return this.ports; }
    public String getWireless() { return this.wireless; }
    public String getWeight() { return this.weight; }
    public String getColor() { return this.color; }
    public String getConditionn() { return this.conditionn; }
    public String getWarranty() { return this.warranty; }
    public List<String> getImages() { return this.images; }
    
    
    
    
    // cái hàm get này thêm vào để t thực hiện cái chức năng  tìm kiếm :)))), còn mấy hàm trên là chức năng xem details
    public void setImages(List<String> images) {
        this.images = images;
    }
}