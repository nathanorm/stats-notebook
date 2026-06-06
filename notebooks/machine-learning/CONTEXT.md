CS830: Machine Learning for Data Analytics – Coursework 1
Part I – 40 marks
Aim of the assignment
The aims of this part of the assignment are to put into practice the concepts covered in lectures, apply
these to a real dataset, and demonstrate your ability to use Python to carry out Machine Learning
tasks.
Learning Outcomes
Understand the aims and fundamental principles of Machine Learning; Understand a range of the
essential core algorithms and approaches to Machine Learning; Apply the algorithms covered on
substantial datasets using Python and Scikit-learn and interpret the outcomes; Understand the
applicability of the algorithms to different types of data and problems along with their strengths and
limitations.
Problem and Dataset
The data you are going to work on comes from Spotify and captures various attributes about songs
and includes a popularity score. You will individually address only one of the following two problems.
Choose the one that resonates with you the most and focus solely on that:
➢ A Regression problem, which aims to predict the popularity score of a song,
➢ A Classification problem, which aims to predict the top genre that a song belongs to.
The dataset can be download from this page (https://www.kaggle.com/cnic92/spotify-past-decadessongs-50s10s). There are seven files on Kaggle, where files are separated by year. Please make sure to
combine these files together and to work on the whole dataset. Also note that there are some missing
values, and the year is not always coherent due to some re-releases, etc. Therefore, make sure to
clean the dataset first.
Instructions
Please allocate sufficient time to carefully consider both problems and select the one you wish to
address, along with identifying the primary question you aim to answer. Additionally, ensure thorough
comprehension of the data or dataset at hand. Remember, it's not mandatory to utilize every
attribute; your focus may involve several or just a few. The essence of this assignment lies greatly in
the process. Therefore, if you discover that the techniques you've employed aren't yielding optimal
results or fail to generate particularly compelling insights, don’t worry. What matters most is adhering
to the appropriate steps in data understanding and preparation, model selection, and being able to
offer insights or explanations into why your model(s) either did or did not perform exceptionally.
No matter which problem you've chosen, you should aim to use a variety of techniques, typically
ranging from 3 to 5. Include basic techniques, which serve as fundamental benchmarks for
comparison, as well as more advanced ones covered in this module. However, prioritize the judicious
application of these techniques over a scatter-gun approach. The focus should lie on utilizing the
techniques appropriately and interpreting the results effectively, rather than simply applying multiple
algorithms without thoughtful consideration.
CS830: Machine Learning for Data Analytics – Coursework 1
Submission
For this part of the assignment, you will need to submit two files:
➢ The first file is the Jupyter/Colab Notebook. This file must be in ipynb extension and all output
of the cells must be displayed (Hint: make sure to click on "Restart & Run all" in the Jupyter
notebook (Anaconda Navigator) to have a clean notebook with output to be submitted). Also,
make sure that the file is well written and well commented.
➢ The second file is the first file (the Jupyter/Colab Notebook) but exported as PDF version.
All files must be submitted using MyPlace; no submission will be accepted in any different way. Any
extension should be requested in advance of the submission deadline, with a valid reason.
Assignments submitted after the deadline without an approved extension will be considered as ‘fail’
and will receive a mark of zero.
The Jupyter / Colab notebook should include the following:
➢ A description of the selected problem and the motivation,
➢ A description of the model and solution that you employed for the final set of predictions,
➢ A justification for why you choose this architecture and solution including: how you came up
with the approach, why you selected or modified input variables, what worked and did not
work, and what other models were tried,
➢ All code to reproduce the final predictions must be included, along with any code
supporting/justifying your choices.
The Python code used and the explanations of the steps should be interleaved within the notebook,
and provided in a logical manner, to show your working and justify your interpretations and analysis
of the outcomes. Explanations should be succinct and clear, with the emphasis justifying the choices
made, and critical interpretation of results. The entire notebook should be runnable and be capable
of reproducing your results.
When compiling your final notebook, the emphasis should be on presenting your final model and
results, not reporting on everything that you've tried. Visualisations should be relevant and used to
support and justify choices about data preparation, feature engineering, model selection etc. The
results of other models explored should be reported but there is no need to talk about these in detail.
Write the report as if you have been commissioned to carry out this work and are aiming to justify the
choice of a model to the client.
It is difficult to specify precise page limits due to the format used, but the report should not exceed
20 pages in length (based on the generated pdf), and the emphasis should be on the appropriate
application of techniques and critical interpretation of results.
CS830: Machine Learning for Data Analytics – Coursework 1
Use of Generative AI (GenAI) Tools – Disclaimer and Guidance
Students may make limited use of Generative AI tools (e.g., ChatGPT, Gemini, Copilot) to support their
work on this assignment only for general learning support and code debugging assistance.
However, any use of such tools must be appropriately acknowledged in your submission.
You must not use GenAI to generate entire code blocks, explanations, or sections of your report
without critical modification and full understanding. Submissions found to include uncredited or
overly reliant GenAI-generated content may be subject to academic misconduct procedures.
If you have used any GenAI tool, you must include a brief "GenAI Acknowledgement" in your
submitted notebook (e.g., at the end or in an appendix), stating:
• The tool(s) used (e.g., ChatGPT, Copilot),
• What you used it for (e.g., debugging syntax errors, explaining concepts),
• A short reflection on how it informed your understanding.
This aligns with the University’s policy on ethical and transparent use of emerging technologies in
assessments.
Samples
Below are some illustrations of reports which use this approach:
➢ Using Python to see how the Times writes about men and women:
https://nealcaren.github.io/text-as-data/html/times_gender.html
➢ An open science approach to a recent false-positive between solar activity and the Indian
monsoon:
https://nbviewer.org/github/benlaken/Comment_BadruddinAslam2014/blob/master/Mons
oon_analysis.ipynb
➢ Kaggle Competition | Titanic Machine Learning from Disaster
https://nbviewer.org/github/agconti/kaggle-titanic/blob/master/Titanic.ipynb
➢ An example machine learning notebook:
https://nbviewer.org/github/rhiever/Data-Analysis-and-Machine-LearningProjects/blob/master/example-data-sciencenotebook/Example%20Machine%20Learning%20Notebook.ipynb
➢ An exploratory statistical analysis of the 2014 World Cup Final:
https://nbviewer.org/github/rjtavares/footballcrunching/blob/master/notebooks/an%20exploratory%20data%20analysis%20of%20the%2
0world%20cup%20final.ipynb
CS830: Machine Learning for Data Analytics – Coursework 1
Part II – 10 marks
Aim of the assignment
Self-assessment activities are designed to engage learners in evaluating the outcomes of their work.
Students are encouraged to objectively assess their own performance, aiming for a realistic evaluation
of their strengths and areas for improvement.
Learning Outcomes
Students are encouraged to objectively reflect on and critically evaluate their own progress and skill
development. This process involves discerning ways to enhance their performance by identifying
strengths and areas for improvement. Through this practice, students cultivate critical reviewing skills,
enabling them to assess their work with clarity and insight.
Instructions
The self-assessment activity enables you to evaluate your report using the "Marking scheme" file and
assign an expected mark for the first part of the assignment, accompanied by a justification.
• Expected mark: Please take your time in reviewing the “Marking Scheme” file to determine the
appropriate mark for the first part on a scale of 0 to 40. Then this mark will be used in a specific
formula to calculate the mark for this part of the assignment, as explained below:
𝑀𝑎𝑟𝑘 = 𝑟𝑜𝑢𝑛𝑑 (10 ∗ (1 − (
|𝑆𝑀 − 𝑀𝑀|
max(40 − 𝑆𝑀, 𝑆𝑀)
)))
o SM is the mark provided by the student in the self-assessment,
o MM is the mark provided by the marker,
o |SM - MM| is the absolute value of the difference between the two marks,
o max (40 - SM, SM) is the maximum value between SM and (40 - SM),
o round is the function used to round the output to the nearest integer.
The following table shows a small example on different possibilities, where 0 is the lowest and 10
is the highest mark you can get on this part:
MM SM Mark
25 40 4
25 35 6
25 30 8
25 25 10
25 20 8
25 15 6
25 10 4
25 5 2
25 0 0
• Justification: The justification should be based on your understanding of the criteria outlined in
the marking scheme, highlighting how well your report aligns with each criterion. Additionally, it
should demonstrate your ability to critically evaluate your own work and provide constructive
feedback for future enhancements. Hence, it is imperative that you invest adequate time in
reviewing the “Marking Scheme” file and provide a well detailed justification for the proposed
mark. Although the justification itself does not bear a separate mark, its quality may affect your 
CS830: Machine Learning for Data Analytics – Coursework 1
mark for this part. To clarify, failure to provide a justification will result in a zero mark, while a
generic or superficial justification may lead to a deduction of half (or more) the mark. Therefore,
endeavour to craft a comprehensive justification that articulates your assessment with precision
and clarity.
Submission
The self-assessment must be submitted through MyPlace using the self-assessment activity. For this
reason, you should:
➢ Download the template file, named "templateSelfAssessment.xlsx",
➢ Edit the file using Microsoft excel or any other editor that allows editing xlsx files. You should
add 3 different values:
o Add your Registration number in the first cell (A3): your registration number consists
of 9 digits,
o Add your self-assessed mark in the second cell (A7): a mark between 0 and 40,
o Add a justification of the mark in the third cell (A11): a well detailed justification with
no more than 1000 words.
Note that the template file is protected with password so it doesn't allow you to change the
format of the template file. The use of the template will allow us to automatically collect all
answers, therefore please make sure to use the template, otherwise your submission might
not be considered for marking.
➢ Once you've finished editing the file, upload and submit your version on MyPlace.
All files must be submitted using MyPlace; no submission will be accepted in any different way. Any
extension should be requested in advance of the submission deadline, with a valid reason.
Assignments submitted after the deadline without an approved extension will be considered as ‘fail’
and will receive a mark of zero.