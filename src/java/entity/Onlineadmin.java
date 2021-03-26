/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Chrisann Lee
 */
@Entity
@Table(name = "ONLINEADMIN")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Onlineadmin.findAll", query = "SELECT o FROM Onlineadmin o")
    , @NamedQuery(name = "Onlineadmin.findById", query = "SELECT o FROM Onlineadmin o WHERE o.id = :id")
    , @NamedQuery(name = "Onlineadmin.findByName", query = "SELECT o FROM Onlineadmin o WHERE o.name = :name")
    , @NamedQuery(name = "Onlineadmin.findByEmail", query = "SELECT o FROM Onlineadmin o WHERE o.email = :email")
    , @NamedQuery(name = "Onlineadmin.findByRole", query = "SELECT o FROM Onlineadmin o WHERE o.role = :role")
    , @NamedQuery(name = "Onlineadmin.findByPassword", query = "SELECT o FROM Onlineadmin o WHERE o.password = :password")
    , @NamedQuery(name = "Onlineadmin.findByStatus", query = "SELECT o FROM Onlineadmin o WHERE o.status = :status")
    , @NamedQuery(name = "Onlineadmin.findByAccount", query = "SELECT o FROM Onlineadmin o WHERE o.email = :email AND o.password = :password")})
public class Onlineadmin implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "ID")
    private String id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "NAME")
    private String name;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "EMAIL")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "ROLE")
    private String role;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "PASSWORD")
    private String password;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "STATUS")
    private String status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "onlineadmin")
    private List<PromotionUpdate> promotionUpdateList;

    public Onlineadmin() {
    }

    public Onlineadmin(String id) {
        this.id = id;
    }

    public Onlineadmin(String id, String name, String email, String role, String password, String status) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.role = role;
        this.password = password;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @XmlTransient
    public List<PromotionUpdate> getPromotionUpdateList() {
        return promotionUpdateList;
    }

    public void setPromotionUpdateList(List<PromotionUpdate> promotionUpdateList) {
        this.promotionUpdateList = promotionUpdateList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Onlineadmin)) {
            return false;
        }
        Onlineadmin other = (Onlineadmin) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Onlineadmin[ id=" + id + " ]";
    }

}
