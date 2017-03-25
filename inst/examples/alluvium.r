# degeneracy (one axis; unavailable through shortcut function)
ggplot(as.data.frame(Titanic),
       aes(weight = Freq,
           axis = Class)) +
  geom_alluvium(aes(fill = Class, alpha = Survived)) +
  scale_alpha_manual(values = c(.25, .75))

# declaration of groups (ignored)
ggplot(as.data.frame(Titanic),
       aes(weight = Freq,
           axis1 = Class, axis2 = Sex, axis3 = Age,
           group = Survived)) +
  geom_alluvium()

# weights omitted
ggplot(as.data.frame(Titanic),
       aes(axis1 = Class, axis2 = Sex, axis3 = Age)) +
  geom_alluvium(aes(fill = Class, alpha = Survived)) +
  scale_alpha_manual(values = c(.25, .75))

# control of horizontal spacing: axis widths and ribbon bends
ggplot(as.data.frame(Titanic),
       aes(weight = Freq,
           axis1 = Class, axis2 = Sex, axis3 = Age)) +
  geom_alluvium(aes(fill = Age),
                width = 1/5, ribbon_bend = 1/3)

# use of strata, annotation, and labels
ggplot(as.data.frame(Titanic),
       aes(weight = Freq,
           axis1 = Class, axis2 = Sex, axis3 = Age)) +
  geom_alluvium() +
  geom_stratum() + geom_text(stat = "stratum") +
  ggtitle("Alluvial diagram of Titanic passenger demographic data") +
  scale_x_continuous(breaks = 1:3, labels = c("Class", "Sex", "Age"))

# use of facets
ggplot(as.data.frame(Titanic),
       aes(weight = Freq,
           axis1 = Class, axis2 = Sex)) +
  geom_alluvium(aes(fill = Age)) +
  geom_stratum() + geom_text(stat = "stratum") +
  scale_x_continuous(breaks = 1:2, labels = c("Class", "Sex")) +
  facet_wrap(~ Survived, scales = "fixed")

# use of lode controls
ggplot(as.data.frame(Titanic),
       aes(weight = Freq,
           axis1 = Class, axis2 = Sex, axis3 = Age)) +
  geom_alluvium(aes(fill = Survived),
                bind.by.aes = TRUE, lode.guidance = "rightward") +
  geom_stratum() + geom_text(stat = "stratum") +
  scale_x_continuous(breaks = 1:3, labels = c("Class", "Sex", "Age"))

# use of lode ordering
lode_ord <- replicate(n = 3, expr = sample(x = 32), simplify = FALSE)
ggplot(as.data.frame(Titanic),
       aes(weight = Freq,
           axis1 = Class, axis2 = Sex, axis3 = Age)) +
  geom_alluvium(aes(fill = Survived),
                lode.ordering = lode_ord) +
  geom_stratum() + geom_text(stat = "stratum") +
  scale_x_continuous(breaks = 1:3, labels = c("Class", "Sex", "Age"))
