var ack = require('ac-koa').require('hipchat');
var pkg = require('./package.json');
var app = ack(pkg);

var addon = app.addon()
  .hipchat()
  .allowRoom(true)
  .scopes('send_notification');

if (process.env.DEV_KEY) {
  addon.key(process.env.DEV_KEY);
}
 
addon.webhook('room_message', /^\/hello$/, function *() {
  yield this.roomClient.sendNotification('Hi, ' + this.sender.name + '!');
});
 
app.listen();
