# SEIR-Model-For-COVID-19

In this small project, I tried to solve the following questions (problems):

1. Write down a SEIR model without births/deaths.  Use values for the rates that correspond to the spread of COVID-19 in New Jersey, and use the population size of New Jersey. Note that you may find a range of values as you search online. That is ok, but justify why you are choosing the values you do choose, and be sure to cite the source.

(a) Using initial values based on numbers of S, E, I, and R in New Jersey on March 15, solve the model numerically using a Runge-Kutta solver (4th order is good). You should run your code for long enough to see the entire epidemic. I would like to see a plot showing number of infectious individuals versus time, as well as a plot showing S, E, I, and R together on the same plot as a function of time.

(b) Now assume that NJ's control policies were good enough to reduce the transmission rate by 80%. Re-solve your model and plot infectious individuals versus time for both the case of part (a) and the reduced transmission case of part (b).

2. Add in births and deaths to the SEIR model and re-solve, showing 2 years worth of epidemic. Use the same value for both births and deaths, and choose it to be the average of the NJ birth rate and NJ death rate. Plot infectious individuals as a function of time.

3. Two models that many governments are using are the CHIME model from the Univ. of Pennsylvania, and the IHME model from the Univ. of Washington. Investigate both models and describe what they are and how they work. What are the pros and cons to both models. Compare your COVID-19 predictions from question 1 to the predictions of CHIME and IHME models, and discuss any similarities or differences there may be. Take screen shots of these model outputs to include in your results.

4. For this last problem, think of yourself as an expert mathematical epidemiologist who can use modelling to make predictions and provide guidance to the Governor of NJ. What problem do you think is important to model now as the state tries to emerge from a near complete shut-down. Provide a brief outline of the model you would have to develop to obtain the answer.
