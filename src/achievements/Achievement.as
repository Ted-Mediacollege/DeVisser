package achievements 
{
	import flash.display.MovieClip;
	
	/* Data van een achievement
	 * 
	 * Eigenschappen:
	 * - name: naam van de achievement
	 * - task: hoe de achievement behaalt kan worden
	 * - done: is de achievement al behaald of niet
	 * - id: nummer van de achievement
	 * - icon: frame in de trofee movieclip
	 */
	
	public class Achievement 
	{
		public var name:String;
		public var task:String;
		public var done:Boolean;
		public var id:int;
		public var icon:int;
		
		public function Achievement(i:int, ic:int, n:String, t:String) 
		{
			id = i;
			icon = ic;
			done = false;
			name = n;
			task = t;
		}	
	}
}