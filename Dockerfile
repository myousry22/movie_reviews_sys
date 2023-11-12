# Use the official Ruby image as a parent image
FROM ruby:3.0.2

# Set the working directory within the container
WORKDIR /app

RUN apt-get update && apt-get install -y nodejs yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.22.11
ENV PATH="/root/.yarn/bin:${PATH}"

# Copy Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install needed gems
RUN bundle install

RUN rails assets:precompile \
  && rm -rf node_modules tmp/cache

COPY . .

# Expose port 3000 to the host
EXPOSE 3000

# Start your application
CMD ["rails", "server", "-b", "0.0.0.0"]