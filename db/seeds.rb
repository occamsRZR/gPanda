# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Program.create!(:name => "SVM",
  :location => "/Users/bfulk/projects/gPanda/lib/svm_proteins/svm.pl",
  :language => "perl")

  Program.create!(:name => "HMMer",
  :location => "/Users/bfulk/projects/gPanda/lib/hmmer/hmmer.rb",
  :language => "ruby")

  Option.create!(:option => "Descriptor", 
                 :value  => "Amino acid")

  Option.create!(:option => "Descriptor",
                 :value  => "Di-peptide bonds")

  Option.create!(:option => "Descriptor",
                 :value  => "Tri-peptide bonds")

  Option.create!(:option => "Gamma",
                 :value  => "int")

  Option.create!(:option => "Tradeoff",
                 :value  => "int")
