package model.to;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class ProductPhoto implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)    
    private int photoId;
    
    @Column( length = 200 )
    private String photoName;
    
    @Column( length = 50)
    private String extNam;
    
    @ManyToOne
    @JoinColumn(name = "productId")
    private ProductInfo product;

    public int getPhotoId() {
        return photoId;
    }

    public void setPhotoId(int photoId) {
        this.photoId = photoId;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public String getExtNam() {
        return extNam;
    }

    public void setExtNam(String extNam) {
        this.extNam = extNam;
    }

    public ProductInfo getProduct() {
        return product;
    }

    public void setProduct(ProductInfo product) {
        this.product = product;
    }
    
    
    
}
