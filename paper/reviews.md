# In the paper:
- I think there needs to be a doi added for the Christ et al paper
- I also think that R and any packages that you mention should be cited too.
- Finally (@acolum be much obliged on your opinion here) I’m not sure about the use of "long format and wide format" for a non-specialist user. @arfon, @labarba perhaps you could provide some guidance for me here.
- In the paper under the Figures section, I think you should elaborate more on your example. It would be beneficial to see an example (with code) of how tsfeaturex can calculate different features and characterize differences between two time series with the same mean but different shapes/peaks. 
- I also think that you should clarify with a diagram and/or more detailed description what long and wide format data means for this package. This would benefit both specialist and non-specialist users.

# In the documentation:
- I can’t find a statement of need, although there is a very good one in the paper.
- you’ve got two issue formats but I wonder what you think about whether the reporting of issues could be highlighted in the readme? Also, where does a user go for help?
- You don’t seem to have used any automated testing (please do correct me if I’m wrong)? How do the users know if the code if working as intended?


# Testing

n = 10
days = 21

test number of rows returned 
test number of NA values in raw data against returned value
test long to wide conversion
test feature correlations matrix
