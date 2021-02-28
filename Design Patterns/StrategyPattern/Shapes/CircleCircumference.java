public class CircleCircumference implements Circumference{
    ShapeProperties shapeProperties;

    CircleCircumference(ShapeProperties shapeProperties){
        this.shapeProperties = shapeProperties;
    }

    @Override
    public double getCircumference() {
        return 2*3.14*shapeProperties.getRadius();
    }

}