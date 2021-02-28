public class ShapeProperties{
    private double length;
    private double breadth;
    private double height;
    private double radius;

    ShapeProperties(double length, double breadth,double height){
        this.length = length;
        this.breadth = breadth;
        this.height = height;
    }

    ShapeProperties(){}

    public void setLength(double length){
        this.length = length;
    }

    public double getLength(){
        return this.length;
    }

    public void setBreadth (double breadth){
        this.breadth = breadth;
    }

    public double getBreadth(){
        return this.breadth;
    }

    public void setHeight(double height){
        this.height = height;
    }

    public double getHeight(){
        return this.height;
    }

    public void setRadius(double radius){
        this.radius = radius;
    }

    public double getRadius(){
        return this.radius;
    }
}