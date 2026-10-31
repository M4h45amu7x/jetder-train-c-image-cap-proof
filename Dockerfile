# TRAIN-C proof: image of 1500 incompressible bytes. Render 1500, commit as Dockerfile on a synthetic repo.
FROM busybox:1.37.0
RUN dd if=/dev/urandom of=/blob.bin bs=1048576 count=1500 && chmod 0444 /blob.bin
EXPOSE 8080
USER 10001:10001
CMD ["sh", "-c", "echo ok > /tmp/index.html && exec busybox httpd -f -p 8080 -h /tmp"]
