class SquareArea implements Area{
    ShapeProperties shapeProperties;

    SquareArea(ShapeProperties shapeProperties){
        this.shapeProperties = shapeProperties;
    }

    public double getArea(){
        return shapeProperties.getLength() * shapeProperties.getLength();
    }
}