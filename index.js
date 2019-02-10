const app = require('express')();
const bodyParser = require('body-parser');
const mysql = require('mysql');

app.use(bodyParser.json({
	limit: '8mb'
})); // support json encoded bodies

// environment variables
const PORT = process.env.PORT || 3003;
const HOST = process.env.HOST || '0.0.0.0';


require('./routes')(app);

const connection = mysql.createConnection({
	host: process.env.MYSQL_HOST || 'lb-reviews-sql',
	port: '6032',
	user: process.env.MYSQL_USER || 'root',
	password: process.env.MYSQL_PASSWORD || 'reviewPassword',
	database: process.env.MYSQL_DATABASE || 'review_suggestions'
});

connection.connect((err) => {
	if (err) {
		console.error('error connecting mysql: ', err);
	} else {
		console.log('mysql connection successful');
		app.listen(PORT, HOST, (err) => {
			if (err) {
				console.error('Error starting  server', err);
			} else {
				console.log('server listening at port ' + PORT);
			}
		});
	}
});
