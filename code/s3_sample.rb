#!/usr/bin/env ruby


require 'rubygems'
require 'bundler/setup'
require 'aws-sdk'
require 'uuid'

s3 = AWS::S3.new

uuid = UUID.new
bucket_name = "ruby-sdk-sample-#{uuid.generate}"
bucket = s3.buckets.create(bucket_name)


object = bucket.objects.create('ruby_sample_key.txt', 'Hello World!')

puts "Created an object in S3 at:"
puts object.public_url


puts "\nUse this URL to download the file:"
puts object.url_for(:read)

puts "(press any key to delete both the bucket and the object)"
$stdin.getc

puts "Deleting bucket #{bucket_name}"
bucket.delete!
