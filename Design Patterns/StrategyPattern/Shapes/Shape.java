public class Shape{
    Area areatype;

    public void setAreaType(Area areatype){
        this.areatype = areatype;
    }

    public double getArea(){
        return areatype.getArea();
    }

}