const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');
const postRouter = require('./routes/post');
const cors = require('cors');
require('dotenv').config();

const uri = `mongodb+srv://${process.env.DB_USERNAME}:${process.env.DB_PASSWORD}@mern-learnit.l8arb8i.mongodb.net/?retryWrites=true&w=majority`;
const connectDB = async () => {
	try {
		await mongoose.connect(uri, {
			useCreateIndex: true,
			useNewUrlParser: true,
			useUnifiedTopology: true,
			useFindAndModify: false,
		});
		console.log('MongoDB connected');
	} catch (error) {
		console.log(error);
		process.exit(1);
	}
};

connectDB();

const app = express();
app.use(express.json());
app.use(cors());

app.use('/api/auth', authRouter);
app.use('/api/posts', postRouter);

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => console.log(`Server started on port ${PORT}`));
