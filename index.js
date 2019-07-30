const k = require('node-rdkafka');

var p = new k.Producer({
	'sasl.username': 'x',
	'sasl.password': 'x',
	'security.protocol': 'SASL_SSL',
	'sasl.mechanism': 'PLAIN',
	'dr_msg_cb': true
});

p.on('ready',()=>{
	console.log("Ready");
});

console.log("Connecting...");
p.connect();

setInterval(function(){console.log("Keep alive...");},1000);

