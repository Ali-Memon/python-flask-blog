-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2020 at 08:11 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `allytech`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(11) NOT NULL,
  `date` datetime(6) DEFAULT current_timestamp(6),
  `msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `date`, `msg`) VALUES
(1, 'alii', 'allylearning01@gmail.com', '123456678', '2020-05-02 23:08:45.879155', 'testing'),
(2, 'Muhammad Ali', 'mali43674@gmail.com', '03133098817', '2020-05-02 23:13:57.064677', 'checking mail'),
(3, 'Muhammad Ali', 'mali43674@gmail.com', '03133098817', '2020-05-03 00:36:49.298249', 'checking mail');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Artificial Intelligence', 'An intro to AI by muhammad ali memon', 'first-post', 'Ali writes that In computer science, artificial intelligence (AI), sometimes called machine intelligence, is intelligence demonstrated by machines, in contrast to the natural intelligence displayed by humans and animals. Leading AI textbooks define the field as the study of \"intelligent agents\": any device that perceives its environment and takes actions that maximize its chance of successfully achieving its goals.[1] Colloquially, the term \"artificial intelligence\" is often used to describe machines (or computers) that mimic \"cognitive\" functions that humans associate with the human mind, such as \"learning\" and \"problem solving\".[2]\r\n\r\nAs machines become increasingly capable, tasks considered to require \"intelligence\" are often removed from the definition of AI, a phenomenon known as the AI effect.[3] A quip in Tesler\'s Theorem says \"AI is whatever hasn\'t been done yet.\"[4] For instance, optical character recognition is frequently excluded from things considered to be AI,[5] having become a routine technology.[6] Modern machine capabilities generally classified as AI include successfully understanding human speech,[7] competing at the highest level in strategic game systems (such as chess and Go),[8] autonomously operating cars, intelligent routing in content delivery networks, and military simulations[9].\r\n\r\nArtificial intelligence was founded as an academic discipline in 1955, and in the years since has experienced several waves of optimism,[10][11] followed by disappointment and the loss of funding (known as an \"AI winter\"),[12][13] followed by new approaches, success and renewed funding.[11][14] For most of its history, AI research has been divided into sub-fields that often fail to communicate with each other.[15] These sub-fields are based on technical considerations, such as particular goals (e.g. \"robotics\" or \"machine learning\"),[16] the use of particular tools (\"logic\" or artificial neural networks), or deep philosophical differences.[17][18][19] Sub-fields have also been based on social factors (particular institutions or the work of particular researchers).[15]\r\n\r\nThe traditional problems (or goals) of AI research include reasoning, knowledge representation, planning, learning, natural language processing, perception and the ability to move and manipulate objects.[16] General intelligence is among the field\'s long-term goals.[20] Approaches include statistical methods, computational intelligence, and traditional symbolic AI. Many tools are used in AI, including versions of search and mathematical optimization, artificial neural networks, and methods based on statistics, probability and economics. The AI field draws upon computer science, information engineering, mathematics, psychology, linguistics, philosophy, and many other fields.\r\n\r\nThe field was founded on the assumption that human intelligence \"can be so precisely described that a machine can be made to simulate it\".[21] This raises philosophical arguments about the nature of the mind and the ethics of creating artificial beings endowed with human-like intelligence. These issues have been explored by myth, fiction and philosophy since antiquity.[22] Some people also consider AI to be a danger to humanity if it progresses unabated.[23][24] Others believe that AI, unlike previous technological revolutions, will create a risk of mass unemployment.[25]\r\n\r\nIn the twenty-first century, AI techniques have experienced a resurgence following concurrent advances in computer power, large amounts of data, and theoretical understanding; and AI techniques have become an essential part of the technology industry, helping to solve many challenging problems in computer science, software engineering and operations research  ', 'post-bg.jpg', '2020-05-07 22:30:08'),
(2, 'This is my second post title', 'Coolest post ever', 'second-post', 'this is going to be second post written by ali', 'home-bg.jpg', '2020-05-03 00:41:13'),
(6, 'third post', 'che guera', 'third-post', 'Ernesto \"Che\" Guevara (/tʃeɪ ɡəˈvɑːrə/;[3] Spanish: [ˈtʃe ɣeˈβaɾa];[4] 14 June 1928[5] – 9 October 1967) was an Argentine Marxist revolutionary, physician, author, guerrilla leader, diplomat, and military theorist. A major figure of the Cuban Revolution, his stylized visage has become a ubiquitous countercultural symbol of rebellion and global insignia in popular culture.[6]\r\n\r\nAs a young medical student, Guevara traveled throughout South America and was radicalized by the poverty, hunger, and disease he witnessed.[7][8] His burgeoning desire to help overturn what he saw as the capitalist exploitation of Latin America by the United States prompted his involvement in Guatemala\'s social reforms under President Jacobo Árbenz, whose eventual CIA-assisted overthrow at the behest of the United Fruit Company solidified Guevara\'s political ideology.[7] Later in Mexico City, Guevara met Raúl and Fidel Castro, joined their 26th of July Movement, and sailed to Cuba aboard the yacht Granma with the intention of overthrowing U.S.-backed Cuban dictator Fulgencio Batista.[9] Guevara soon rose to prominence among the insurgents, was promoted to second in command and played a pivotal role in the victorious two-year guerrilla campaign that deposed the Batista regime.[10]\r\n\r\nFollowing the Cuban Revolution, Guevara performed a number of key roles in the new government. These included reviewing the appeals and firing squads for those convicted as war criminals during the revolutionary tribunals,[11] instituting agrarian land reform as minister of industries, helping spearhead a successful nationwide literacy campaign, serving as both national bank president and instructional director for Cuba\'s armed forces, and traversing the globe as a diplomat on behalf of Cuban socialism. Such positions also allowed him to play a central role in training the militia forces who repelled the Bay of Pigs Invasion,[12] and bringing Soviet nuclear-armed ballistic missiles to Cuba, which preceded the 1962 Cuban Missile Crisis.[13] Additionally, Guevara was a prolific writer and diarist, composing a seminal manual on guerrilla warfare, along with a best-selling memoir about his youthful continental motorcycle journey. His experiences and studying of Marxism–Leninism led him to posit that the Third World\'s underdevelopment and dependence was an intrinsic result of imperialism, neocolonialism and monopoly capitalism, with the only remedy being proletarian internationalism and world revolution.[14][15] Guevara left Cuba in 1965 to foment revolution abroad, first unsuccessfully in Congo-Kinshasa and later in Bolivia, where he was captured by CIA-assisted Bolivian forces and summarily executed.[16] ', '', '2020-05-11 21:29:11'),
(7, 'bilgates', 'bil-gates that you dont know', 'fourth-post', 'William Henry Gates III (born October 28, 1955) is an American business magnate, software developer, investor, and philanthropist. He is best known as the co-founder of Microsoft Corporation.[2][3] During his career at Microsoft, Gates held the positions of chairman, chief executive officer (CEO), president and chief software architect, while also being the largest individual shareholder until May 2014. He is one of the best-known entrepreneurs and pioneers of the microcomputer revolution of the 1970s and 1980s.\r\n\r\nBorn and raised in Seattle, Washington, Gates co-founded Microsoft with childhood friend Paul Allen in 1975, in Albuquerque, New Mexico; it went on to become the world\'s largest personal computer software company.[4][a] Gates led the company as chairman and CEO until stepping down as CEO in January 2000, but he remained chairman and became chief software architect.[7] During the late 1990s, Gates had been criticized for his business tactics, which have been considered anti-competitive. This opinion has been upheld by numerous court rulings.[8] In June 2006, Gates announced that he would be transitioning to a part-time role at Microsoft and full-time work at the Bill & Melinda Gates Foundation, the private charitable foundation that he and his wife, Melinda Gates, established in 2000.[9] He gradually transferred his duties to Ray Ozzie and Craig Mundie.[10] He stepped down as chairman of Microsoft in February 2014 and assumed a new post as technology adviser to support the newly appointed CEO Satya Nadella.[11]\r\n\r\nSince 1987, he has been included in the Forbes list of the world\'s wealthiest people.[12][13] From 1995 to 2017, he held the Forbes title of the richest person in the world all but four of those years.[1] In October 2017, he was surpassed by Amazon founder and CEO Jeff Bezos, who had an estimated net worth of US$90.6 billion compared to Gates\' net worth of US$89.9 billion at the time.[14] As of November 2019, Gates had an estimated net worth of US$107.1 billion, making him the second-wealthiest person in the world, behind Bezos.[b] ', '', '2020-05-11 21:29:11'),
(8, 'elonmusk', 'ELON-MUSK and his life', 'fifth-post', 'Elon Reeve Musk FRS (/ˈiːlɒn/; born June 28, 1971) is an engineer, industrial designer, technology entrepreneur and philanthropist.[2][3][4] He is a citizen of South Africa, the United States (where he has lived most of his life and currently resides), and Canada.[note 1] He is the founder, CEO and chief engineer/designer of SpaceX;[6] co-founder,[7] CEO and product architect of Tesla, Inc.;[8][9] founder of The Boring Company;[10] co-founder of Neuralink; and co-founder and initial co-chairman of OpenAI.[11] He was elected a Fellow of the Royal Society (FRS) in 2018.[12][13] In December 2016, he was ranked 21st on the Forbes list of The World\'s Most Powerful People,[14] and was ranked joint-first on the Forbes list of the Most Innovative Leaders of 2019.[15] As of May 2020, he has a net worth of $39.4 billion and is listed by Forbes as the 23rd-richest person in the world.[16][1] He is the longest tenured CEO of any automotive manufacturer globally.[17]\r\n\r\nBorn and raised in Pretoria, South Africa, Musk briefly attended the University of Pretoria before moving to Canada when he was 17 to attend Queen\'s University. He transferred to the University of Pennsylvania two years later, where he received a bachelor\'s degree in economics from the Wharton School and a bachelor\'s degree in physics from the College of Arts and Sciences. He began a Ph.D. in applied physics and material sciences at Stanford University in 1995 but dropped out after two days to pursue a business career. He subsequently co-founded (with his brother Kimbal) Zip2, a web software company, which was acquired by Compaq for $340 million in 1999. Musk then founded X.com, an online bank. It merged with Confinity in 2000, which had launched PayPal the previous year and was subsequently bought by eBay for $1.5 billion in October 2002.[8][18][19][20]\r\n\r\nIn May 2002, Musk founded SpaceX, an aerospace manufacturer and space transport services company, of which he is CEO and lead designer. He joined Tesla Motors, Inc. (now Tesla, Inc.), an electric vehicle manufacturer, in 2004, the year after it was founded,[8] and became its CEO and product architect. In 2006, he inspired the creation of SolarCity, a solar energy services company (now a subsidiary of Tesla). In 2015, Musk co-founded OpenAI, a nonprofit research company that aims to promote friendly artificial intelligence. In July 2016, he co-founded Neuralink, a neurotechnology company focused on developing brain–computer interfaces. In December 2016, Musk founded The Boring Company, an infrastructure and tunnel construction company focused on tunnels optimized for electric vehicles.\r\n\r\nApart from Tesla, Musk is not an investor in the stock market.[21] In addition to his primary business pursuits, Musk has envisioned a high-speed transportation system known as the Hyperloop, and has proposed a vertical take-off and landing supersonic jet electric aircraft with electric fan propulsion, known as the Musk electric jet.[22] Musk has said the goals of SpaceX, Tesla, and SolarCity revolve around his vision to \"change the world and help humanity\".[23] His goals include reducing global warming through sustainable energy production and consumption, and reducing the risk of human extinction by establishing a human colony on Mars.[24][25] ', '', '2020-05-11 21:36:42'),
(9, 'ynh', 'Yuval Noah Harari', 'sixth-post', 'Yuval Noah Harari (Hebrew: יובל נח הררי‎, [juˈval ˈnoaχ (h)aˈʁaʁi]; born 24 February 1976) is an Israeli historian and a professor in the Department of History at the Hebrew University of Jerusalem.[1] He is the author of the popular science bestsellers Sapiens: A Brief History of Humankind (2014), Homo Deus: A Brief History of Tomorrow (2016), and 21 Lessons for the 21st Century (2018). His writings examine free will, consciousness, intelligence and happiness.\r\n\r\nHarari writes about the \"cognitive revolution\" occurring roughly 70,000 years ago when Homo sapiens supplanted the rival Neanderthals, developed language skills and structured societies, and ascended as apex predators, aided by the agricultural revolution and accelerated by the scientific method, which have allowed humans to approach near mastery over their environment. His books also examine the possible consequences of a futuristic biotechnological world in which intelligent biological organisms are surpassed by their own creations; he has said \" Homo sapiens as we know them will disappear in a century or so\".[2] ', '', '2020-05-11 21:36:42'),
(10, 'Robert Toru Kiyosaki ', 'Robert Toru Kiyosaki ', 'seventh-post', 'Robert Toru Kiyosaki (born April 8, 1947) is an American businessman and author.[1] Kiyosaki is the founder of Rich Global LLC and the Rich Dad Company, a private financial education company that provides personal finance and business education to people through books and videos.[2] The company\'s main revenues come from franchisees of the Rich Dad seminars that are conducted by independent individuals using Kiyosaki\'s brand name for a fee.[citation needed] He is also the creator of the Cashflow board and software games to educate adults and children about business and financial concepts.[3]\r\n\r\nKiyosaki\'s seminars in the United States and Canada are conducted in collaboration with a company called Whitney Information Network and are contracted out to local companies as franchisees in other countries.[4] However, some attendees have sued Kiyosaki on claims that his high-priced seminars did not deliver anything special.[5]\r\n\r\nKiyosaki is the author of more than 26 books, including the international self-published personal finance Rich Dad Poor Dad series of books which has been translated into 51 languages and sold over 41 million copies worldwide.[6][7] He has been criticized for advocating practices of debatable legality perceived as \"get rich quick\" philosophy.[8] Kiyosaki is the subject of a class action suit filed by people who attended his seminars and has been the subject of two investigative documentaries by CBC Canada and WTAE USA.[9][10] Kiyosaki\'s company filed for bankruptcy in 2012.[11] ', '', '2020-05-11 21:40:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
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
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
