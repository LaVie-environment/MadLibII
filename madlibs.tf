terraform {
    required_version = ">= 0.15"
    required_providers {
        random = {
        source = "hashicorp/random"
        version = "~> 3.0"
        }
    }
}


locals {
    uppercase_words = {for k, v in var.words : k => [for s in v : upper(s)]}
}

locals {
    templates = tolist(fileset(path.module, "templates/*.txt"))
}

resource "random_shuffle" "random_nouns" {
    count = var.num_files
    input = local.uppercase_words["nouns"]
}

resource "random_shuffle" "random_adjectives" {
    count = var.num_files
    input = local.uppercase_words["adjectives"]
}

resource "random_shuffle" "random_verbs" {
    count = var.num_files
    input = local.uppercase_words["verbs"]
}

resource "random_shuffle" "random_adverbs" {
    count = var.num_files
    input = local.uppercase_words["adverbs"]
}

resource "random_shuffle" "random_numbers" {
    count = var.num_files
    input = local.uppercase_words["numbers"]
}

resource "local_file" "mad_libs" {
    count = var.num_files
    filename = "madlibs/madlibs-${count.index}.txt"
    content = templatefile(element(local.templates, count.index),
        {
            nouns = random_shuffle.random_nouns[count.index].result
            adjectives = random_shuffle.random_adjectives[count.index].result
            verbs = random_shuffle.random_verbs[count.index].result
            adverbs = random_shuffle.random_adverbs[count.index].result
            numbers = random_shuffle.random_numbers[count.index].result
        }
    )
}