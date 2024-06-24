FROM alpine:3.14

# Install necessary packages
RUN apk add --no-cache iproute2 bash

# Copy the script into the container
COPY scripts/enable-pkey.sh /usr/local/bin/enable-pkey.sh

# Make the script executable
RUN chmod +x /usr/local/bin/enable-pkey.sh

# Command to run the script
CMD ["/usr/local/bin/enable-pkey.sh"]
