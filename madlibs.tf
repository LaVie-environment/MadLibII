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

resource "random_shuffle" "random_nouns" {
    input = local.uppercase_words["nouns"]
}

resource "random_shuffle" "random_adjectives" {
    input = local.uppercase_words["adjectives"]
}

resource "random_shuffle" "random_verbs" {
    input = local.uppercase_words["verbs"]
}

resource "random_shuffle" "random_adverbs" {
    input = local.uppercase_words["adverbs"]
}

resource "random_shuffle" "random_numbers" {
    input = local.uppercase_words["numbers"]
}
