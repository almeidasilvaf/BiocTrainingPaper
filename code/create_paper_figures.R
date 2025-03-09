
#' This document contains the code used to create the figures in the paper.

# Load required packages
library(tidyverse)
library(patchwork)
library(here)


# Load plots
geo_instructors <- readRDS(here("products", "plots", "instructors_geodistro.rds"))
geo_workshops <- readRDS(here("products", "plots", "workshops_geodistro.rds"))
experience <- readRDS(here("products", "plots", "experience_with_workshop.rds"))


# Create multi-panel figure
final_fig <- wrap_plots(
    wrap_plots(
        geo_instructors + 
            theme(plot.margin = margin(l = -40, r = -20)) +
            labs(
                title = "Carpentries-certified instructors"
            ), 
        geo_workshops + 
            theme(plot.margin = margin(l = -40, r = -20)) +
            labs(title = "Bioconductor Carpentry workshops")
    ),
    experience,
    nrow = 2,
    heights = c(2, 1)
) +
    plot_annotation(tag_levels = "A")

final_fig

ggsave(
    final_fig, 
    filename = here("products", "figs", "fig_carpentries.png"),
    width = 11, height = 7, dpi = 300
)

ggsave(
    final_fig, 
    filename = here("products", "figs", "fig_carpentries.pdf"),
    width = 11, height = 7
)
