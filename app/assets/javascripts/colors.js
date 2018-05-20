window.ColorPallete = {
  defaultRgb: {
    blue: '151,187,205',
    lightGrey: '220,220,220',
    red: '247,70,74',
    green: '70,191,189',
    yellow: '253,180,92',
    grey: '148,159,177',
    darkGrey: '77,83,96',
  },
  pointer: 1,
  getRgb: function(){
    var colors = Object.values(this.defaultRgb);
    var key = this.pointer % colors.length;
    this.pointer++;
    return colors[key];
  }
}
