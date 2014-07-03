package util 
{
	/* Reken sommetjes voor het uitrekenen
	 * van cordinaaten
	 * 
	 * methods:
	 * - getNextX(Number, Number, Number) volgende X cordinaat ophalen op basis van xpos, richting en snelheid 
	 * - getNextY(Number, Number, Number) volgende Y cordinaat ophalen op basis van ypos, richting en snelheid
	 * - getDistance(Number, Number, Number, Number) afstand berekenen tussen 2 punten
	 * - getDegreeFromPoint(Number, Number, Number, Number) richting ophalen van de coordinaaten naar andere coordinaten
	 */
	
	public class Coords 
	{	
		public static function getNextX(x:Number, d:Number, s:Number):Number
		{
			return x + (s * Math.cos(d * Math.PI / 180.0));
		}

		public static function getNextY(y:Number, d:Number, s:Number):Number
		{
			return y + (s * Math.sin(d * Math.PI / 180.0));
		}
		
		public static function getDistance(x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			return Math.sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
		}
		
		public static function getDegreeFromPoint(x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			return Math.atan2((y2 - y1), (x2 - x1)) * 180 / Math.PI;
		}
	}
}