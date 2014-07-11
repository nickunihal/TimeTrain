// Configuration for the Timeline
var options = {
  height: '300px',
  min: new Date(2008, 0, 1),                // lower limit of visible range
  max: new Date(2014, 8, 1),                // upper limit of visible range
};


  /**
  * Move the timeline a given percentage to left or right
  * @param {Number} percentage   For example 0.1 (left) or -0.1 (right)
  */
  function move (percentage) {
    var range = timeline.getWindow();
    var interval = range.end - range.start;

    timeline.setWindow({
      start: range.start.valueOf() - interval * percentage,
      end:   range.end.valueOf()   - interval * percentage
    });
  }

  /**
  * Zoom the timeline a given percentage in or out
  * @param {Number} percentage   For example 0.1 (zoom out) or -0.1 (zoom in)
  */
  function zoom (percentage) {
    var range = timeline.getWindow();
    var interval = range.end - range.start;

    timeline.setWindow({
      start: range.start.valueOf() - interval * percentage,
      end:   range.end.valueOf()   + interval * percentage
    });
  }
// Content generators
  // //fb post item
  // var facebook = document.createElement('div');
  // var imgfb = document.createElement('img');
  // imgfb.src = 'images/facebook.png';
  // imgfb.style.width = '12px';
  // imgfb.style.height = '12px';
  // facebook.appendChild(imgfb);

  // //twitter post item
  // var twitter = document.createElement('div');
  // var imgtw = document.createElement('img');
  // imgtw.src = 'images/twitter.png';
  // imgtw.style.width = '12px';
  // imgtw.style.height = '12px';
  // twitter.appendChild(imgtw);

  // //google plus post item
  // var gplus = document.createElement('div');
  // var imggp = document.createElement('img');
  // imggp.src = 'images/gplus.png';
  // imggp.style.width = '12px';
  // imggp.style.height = '12px';
  // gplus.appendChild(imggp);
//Content generator end