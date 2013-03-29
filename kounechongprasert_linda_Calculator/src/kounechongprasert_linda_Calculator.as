/*
Linda Kounechongprasert
3/28/13
Calculator
FFM-O 1303
*/
package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	
	public class kounechongprasert_linda_Calculator extends Sprite
	{
		//making these variables accessible to all functions within this class
		private var _amtPplInput:TextField = new TextField();
		private var _amtBtlInput:TextField = new TextField();
		private var _shotsPerInput:TextField = new TextField();
		private var _resultField:TextField = new TextField();
		
		public function kounechongprasert_linda_Calculator()
		{
			//adding visual elements
			//adding background color
			var bg:ColorBg = new ColorBg();
			this.addChild(bg);
			bg.scaleX = bg.scaleY = 2.5;
			//adding bottle image
			var bottle:Bottle = new Bottle();
			this.addChild(bottle);
			bottle.x = 425;
			bottle.y = 175;
			bottle.scaleX = 1.25;
			//adding loops for image of shotGlass
			for(var i:uint=0; i<5; i++)
			{
				var shot:ShotGlass = new ShotGlass();
				this.addChild(shot);
				shot.x = -50;
				shot.y = 50 * 2 * i;
				shot.scaleX = shot.scaleY = 1.25;
			}
			for(var j:uint=0; j<5; j++)
			{
				var shot2:ShotGlass = new ShotGlass();
				this.addChild(shot2);
				shot2.x = 575;
				shot2.y = 50 * 2 * j;
				shot2.scaleX = shot2.scaleY = 1.25;
			}	
			
			
			//adding title for calculator
			var titleLabel:TextField = new TextField();
			placeField(titleLabel, "Do You Have Enough Alcohol for Your Party?", 25);
			titleLabel.width = 400;
			
			//placing the button that will calculate the results
			var btn:CalcBtn = new CalcBtn();
			this.addChild(btn);
			//positioning and sizing the button 
			btn.x = 150;
			btn.y = 300;
			btn.scaleX = btn.scaleY = .7;
			//telling Flash what event to "listen" for and what to do
			btn.addEventListener(MouseEvent.CLICK, calcInfo);
			
			//creating labels for the input fields
			var amtPplLabel:TextField = new TextField();
			placeField(amtPplLabel, "Number of Party People:", 100);
			
			var amtBtlLabel:TextField = new TextField();
			placeField(amtBtlLabel, "How many bottles? \n(Assuming each bottle is 750ml)", 140);
			
			var shotsPerLabel:TextField = new TextField();
			placeField(shotsPerLabel, "How many shots per person? \n(1 oz shots)", 200);
			
			//creating user input fields
			//restricting characters that can be input
			placeInput(_amtPplInput, 100);
			_amtPplInput.restrict = "0-9";
			
			
			placeInput(_amtBtlInput, 150);
			_amtBtlInput.restrict = "0-9";
			
			
			placeInput(_shotsPerInput, 200);
			_shotsPerInput.restrict = "0-9";
			
			//creating the results field
			this.addChild(_resultField);
			_resultField.height = 100;
			_resultField.x = 360;
			_resultField.width = 130;
			_resultField.y = 155;
			_resultField.wordWrap=true;
			//formatting the results field
			
			var format:TextFormat = new TextFormat();
			format.font = "Book Antiqua";
			format.size = 12;
			format.align = TextFormatAlign.CENTER;			
			_resultField.defaultTextFormat = format;
		
			
		}
		//creating a function for the labels
		private function placeField(field:TextField, contents:String, fieldY:Number):void
		{
			this.addChild(field); 
			field.x = 20;
			field.text = contents;
			field.y = fieldY;
			field.height = 60;
			field.width = 250;
			//formating the labels
			var format:TextFormat = new TextFormat();
			format.font = "Book Antiqua";
			format.size = 16;
			
			field.setTextFormat(format);
		}
		//creating a function for the user input
		private function placeInput(f:TextField, fY:Number):void
		{
			this.addChild(f);
			f.x = 250;
			f.border = true;
			f.height = 30;
			f.y = fY;
			f.width = 35;
			f.type = TextFieldType.INPUT;
			//formatting the input fields
			var format:TextFormat = new TextFormat();
			format.color = 0xFFFFFF;
			format.font = "Book Antiqua";
			format.size = 16;
			format.align = TextFormatAlign.CENTER;
			
			f.defaultTextFormat = format;
		}
		//creating a function that will calculate the info
		private function calcInfo(event:MouseEvent):void
		{
			//if my input fields are not blank then...run this function
			if(_amtPplInput.text!="" && _amtBtlInput.text!="" && _shotsPerInput.text!=""){
				//casting my TextFields so they will be treated like a number in my calculations
				var numPpl:Number = Number(_amtPplInput.text);
				var numBtls:Number = Number(_amtBtlInput.text);
				var numShots:Number = Number(_shotsPerInput.text);
				//if my calculations are greater than or equal to one then this is my result...
				if((numBtls*25)/(numPpl*numShots) >=1){
					_resultField.text = "Get ready to party! You have enough alcohol!";
				}else{//if my calculations are less than 1 then this is the result...
					_resultField.text = "Better make a liquor run! You don't have enough alcohol for everyone!";
				}
			}else{//if any of my input fields are blank return this message
				_resultField.text = "Oops! You are missing some information.";
			}
		}
	}
}