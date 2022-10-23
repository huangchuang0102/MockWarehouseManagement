package com.example.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "products")
public class Products {

    @Id
    @Column(name = "upc")
    String upc;

    @Column(name = "prod_name")
    String prod_name;

    @Column(name = "brand")
    String brand;

    @Column(name = "prod_description")
    String prod_description;

    @Column(name = "category")
    String category;

    @Column(name = "price_per_unit")
    float price_per_unit;

    @Column(name = "image_url")
    String image_url;

    @Column(name = "available_stock")
    int available_stock;

    @Column(name = "reserved_stock")
    int reserved_stock;

    @Column(name = "shipped_stock")
    int shipped_stock;

    public Products(){super();};

    public Products(String upc, String prod_name, String brand, String prod_description,
                    String category, float price_per_unit, String image_url, int available_stock,
                    int reserved_stock, int shipped_stock) {
        this.upc = upc;
        this.prod_name = prod_name;
        this.brand = brand;
        this.prod_description = prod_description;
        this.category = category;
        this.price_per_unit = price_per_unit;
        this.image_url = image_url;
        this.available_stock = available_stock;
        this.reserved_stock = reserved_stock;
        this.shipped_stock = shipped_stock;
    }

    public String getUpc() {
        return upc;
    }

    public void setUpc(String upc) {
        this.upc = upc;
    }

    public String getProdname() {
        return prod_name;
    }

    public void setProdname(String prod_name) {
        this.prod_name = prod_name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getProddescription() {
        return prod_description;
    }

    public void setProddescription(String prod_description) {
        this.prod_description = prod_description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public float getPriceperunit() {
        return price_per_unit;
    }

    public void setPriceperunit(float price_per_unit) {
        this.price_per_unit = price_per_unit;
    }

    public String getImageurl() {
        return image_url;
    }

    public void setImageurl(String image_url) {
        this.image_url = image_url;
    }

    public int getAvailablestock() {
        return available_stock;
    }

    public void setAvailablestock(int available_stock) {
        this.available_stock = available_stock;
    }

    public int getReservedstock() {
        return reserved_stock;
    }

    public void setReservedstock(int reserved_stock) {
        this.reserved_stock = reserved_stock;
    }

    public int getShippedstock() {
        return shipped_stock;
    }

    public void setShippedstock(int shipped_stock) {
        this.shipped_stock = shipped_stock;
    }

    @Override
    public String toString() {
        return "Product{" +
                "upc='" + upc + '\'' +
                ", prod_name='" + prod_name + '\'' +
                ", brand='" + brand + '\'' +
                ", prod_description='" + prod_description + '\'' +
                ", category='" + category + '\'' +
                ", price_per_unit=" + price_per_unit +
                ", image_url='" + image_url + '\'' +
                ", available_stock=" + available_stock +
                ", reserved_stock=" + reserved_stock +
                ", shipped_stock=" + shipped_stock +
                '}';
    }
}
