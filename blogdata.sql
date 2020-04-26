-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2020 at 08:48 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogdata`
--

-- --------------------------------------------------------

--
-- Table structure for table `contactdata`
--

CREATE TABLE `contactdata` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone_no` int(10) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contactdata`
--

INSERT INTO `contactdata` (`sno`, `name`, `email`, `phone_no`, `msg`, `date`) VALUES
(1, 'Pratik Bandu Garud', 'pratikgarud28@gmail.com', 2147483647, 'All Done !!', NULL),
(2, 'Kishor Ankush', 'kishorankush10@gmail.com', 2147483647, 'Message is send successfully!!', NULL),
(3, 'Rahul Ankush', 'rahulankush28@gmail.com', 2147483647, 'Finally Done!!', '2020-04-23 20:20:52');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(15) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(25) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Hottest tech skills to hire for in 2020.', 'first-post', 'The benefits of honing technical skills go far beyond the Information Technology industry. Strong tech skills are essential in today’s changing world, and if your employees consistently and proactively.', 'fp.png', '2020-04-25 12:19:05'),
(3, 'Where to start learning of machine learning?', 'learn-model', 'This is Billy. Billy wants to buy a car. He tries to calculate how much he needs to save monthly for that. He went over dozens of ads on the internet and learned that new cars are around $20,000, used year-old ones are $19,000, 2-year old are $18,000 and so on.  Billy, our brilliant analytic, starts seeing a pattern: so, the car price depends on its age and drops $1,000 every year, but won\'t get lower than $10,000.  In machine learning terms, Billy invented regression – he predicted a value (price) based on known historical data. People do it all the time, when trying to estimate a reasonable cost for a used iPhone on eBay or figure out how many ribs to buy for a BBQ party. 200 grams per person? 500?  Yeah, it would be nice to have a simple formula for every problem in the world. Especially, for a BBQ party. Unfortunately, it\'s impossible.  Let\'s get back to cars. The problem is, they have different manufacturing dates, dozens of options, technical condition, seasonal demand spikes, and god only knows how man', 'learn.png', '2020-04-24 21:31:56'),
(5, 'Learning vs Intelligence', 'learn-int', 'Once I saw an article titled \"Will neural networks replace machine learning?\" on some hipster media website. These media guys always call any shitty linear regression at least artificial intelligence, almost SkyNet. Here is a simple picture to show who is who.Artificial intelligence is the name of a whole knowledge field, similar to biology or chemistry.  Machine Learning is a part of artificial intelligence. An important part, but not the only one.  Neural Networks are one of machine learning types. A popular one, but there are other good guys in the class.  Deep Learning is a modern method of building, training, and using neural networks. Basically, it\'s a new architecture. Nowadays in practice, no one separates deep learning from the \"ordinary networks\". We even use the same libraries for them. To not look like a dumbass, it\'s better just name the type of network and avoid buzzwords.', 'int.jpg', '2020-04-24 21:37:17'),
(6, 'Is Machine Learning easier than Mathematics?', 'math', '  You need to have a good understanding of linear algebra, calculus, probability etc to excel in ML. However ML is not just solving some calculus problem, but use them as one of the many tools to solve difficult real world problems. You probably need to take few CS courses to ramp up your programming abilities, unless you want to be a theoretician. Your background in math will come in handy for Masters but to contribute something novel you should have to learn to think out of the box. And Its also depends Machine learning is a field of statistics/applied mathematics, and it requires a fairly broad and deep basis of knowledge, particularly if you tackle problems like deep learning architectures, topological data analysis, or Bayesian methods. Easy probably depends on the person. I could read topology papers all day but have a difficult time with abstract algebra (easier since algebraic topology).', 'mathpost.png', '2020-04-25 22:04:53'),
(7, 'The map of the machine learning world.', 'map', 'Always important to remember — there is never a sole way to solve a problem in the machine learning world. There are always several algorithms that fit, and you have to choose which one fits better. Everything can be solved with a neural network, of course, but who will pay for all these GeForces?', 'map.jpg', '2020-04-25 22:45:53'),
(8, 'Basic of Neural Networks and Deep Leaning.', 'ml&dl', 'Neural Network : Any neural network is basically a collection of neurons and connections between them. Neuron is a function with a bunch of inputs and one output. Its task is to take all numbers from its input, perform a function on them and send the result to the output. Neural networks are a computing system with interconnected nodes that work more like the neurons in a human brain. ... Neural networks are used to solve complex problems people face in real-world situations. These networks can learn and model the relationships between inputs and outputs that are complex and nonlinear.\r\nDeep Learning : Is a subset of machine learning where artificial neural networks, algorithms inspired by the human brain, learn from large amounts of data. ... Deep learning allows machines to solve complex problems even when using a data set that is very diverse, unstructured and inter-connected.\r\nExample : Deep learning is a key technology behind driverless cars, enabling them to recognize a stop sign, or to distinguish a pedestrian from a lamppost.', 'nn.jpg', '2020-04-25 22:53:27'),
(10, 'Building a Foundation for Machine Learning Across Your Organization.', 'building a foun', 'Common production concerns that must be solved for when building an ML foundation include:\r\n1. Model problems in production. Models need to be trained, updated, and deployed seamlessly, but issues 2. can arise with disparate data sources, multiple model types in production (supervised/unsupervised), and multiple languages of implementation.\r\n3. Temporal drift. Data changes over time.\r\n4. Context loss. Model developers forget their reasoning over time.\r\n5. Technical debt. Known to be an issue in production learning environments. ML models are difficult to fully understand by their creators, and this is even more difficult for employees who are not ML experts. Automating this process can minimize technical debt.\r\n\r\nThe ideal system can address these overarching ML production considerations while also serving common adversarial concerns, including:\r\n1. Historical data and model training\r\n2. Model monitoring and accuracy tracking over time\r\n3. Ability to work with distributed training systems\r\n4. Custom tests per model to validate accuracy\r\n5. Deployment to production model servers\r\n\r\nModel Management & Setting a Technical Foundation\r\nWhile each organization differs, these are high-level considerations for effective model management:\r\n1. Historical training data with fine-grained time controls\r\n2. Distributed training functionality\r\n3. Ability to support multiple languages\r\n4. Robust testing and reporting support\r\n5. Model accuracy must be understood easily\r\n6. Model feature-set, methodology, and code tracking\r\n7. Provenance of data and definitions for internal data definitions\r\n8. Open Source tooling\r\n9. Custom retrain and loss functions on a cron-like basis to refresh stale models\r\n10. Minimal impact on model developers and dedicated ML engineers', 'org.jpeg', '2020-04-25 23:16:44'),
(11, 'Present & Future of Machine Learning.', 'present&future', 'Machine Learning in the Present. Big demand for GPUs\r\nToday, the demand for GPUs continues to rise as companies from all kinds of industries seek to put their data to work and realize the benefits of AI and machine learning. Some examples of machine learning applications we can see today are medical diagnosis, machine maintenance prediction, and targeted advertising.\r\n \r\nHowever, when it comes to applying machine learning models in the real world, there’s a certain stumbling block that is hindering progress. And that stumbling block is called latency.\r\n\r\nEdge machine learning\r\nMost companies today store their data in the cloud. This means that data has to travel to a central data center—which is often located thousands of miles away—for model comparison before the concluding insight can be relayed back to the device of origin. This is a critical, and even dangerous problem in cases such as fall detection where time is of the essence.\r\n \r\nThe problem of latency is what is driving many companies to move from the cloud to the edge today. “Intelligence on the edge,” Edge AI” or “Edge machine learning” means that, instead of being processed in algorithms located in the cloud, data is processed locally in algorithms stored on a hardware device. This not only enables real-time operations, but it also helps to significantly reduce the power consumption and security vulnerability associated with processing data in the cloud.\r\n\r\nSolving power constraint issues \r\nAs we move towards applying AI and edge machine learning to smaller and smaller devices and wearables, resource constraints are presenting another major roadblock. How can we run machine learning applications on tiny devices without sacrificing performance and accuracy?\r\n \r\nWhile moving from the cloud to the edge is a vital step in solving resource constraint issues,many machine learning models are still using too much computing power and memory to be able to fit the small microprocessors on the market today. Many are approaching this challenge by creating more efficient software, algorithms and hardware. Or by combining these components in a specialized way. \r\n\r\nEdge Machine Learning in the Future : \r\nUnsupervised machine learning\r\nIn the majority of AI and machine learning projects today, the tedious process of sorting and labelling data takes up the bulk of development time. In fact, the analyst firm Cognilytica estimated that in the average AI project, about 80% of project time is used aggregating, cleaning, labeling, and augmenting data to be used in machine learning models.\r\n \r\nThis is why the prospect of unsupervised learning is so exciting. In the future, more and more machines will be able to independently identify previously unknown patterns within a data set which has not been labelled or categorized. Unsupervised learning is particularly useful for discovering previously unknown patterns in a data set when you do not know what the outcome should be. This could be useful for applications such as analyzing consumer data to determine the target market for a new product or detecting data anomalies like fraudulent transactions or malfunctioning hardware.\r\n  ', 'future.png', '2020-04-26 11:57:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contactdata`
--
ALTER TABLE `contactdata`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contactdata`
--
ALTER TABLE `contactdata`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
