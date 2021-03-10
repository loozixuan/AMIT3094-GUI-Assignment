/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

/**
 *
 * @author Chrisann Lee
 */
public class SubCategories extends Category {

    private String idSubCategories;
    private String nameSubCategories;

    public SubCategories() {

    }

    public SubCategories(String idSubCategories, String nameSubCategories, String idCategory, String nameCategory) {
        super(idCategory, nameCategory);
        this.idSubCategories = idSubCategories;
        this.nameSubCategories = nameSubCategories;
    }

    public void setIdSubCategories(String idSubCategories) {
        this.idSubCategories = idSubCategories;
    }

    public void setNameSubCategories(String nameSubCategories) {
        this.nameSubCategories = nameSubCategories;
    }

    public String getIdSubCategories() {
        return idSubCategories;
    }

    public String getNameSubCategories() {
        return nameSubCategories;
    }

    public String toString() {
        return String.format("%s %-5s %-10s ", super.toString(), idSubCategories, nameSubCategories);
    }

}
