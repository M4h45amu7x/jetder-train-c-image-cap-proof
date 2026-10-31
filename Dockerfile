# TRAIN-C proof: image of 2200 incompressible bytes. Render 2200, commit as Dockerfile on a synthetic repo.
FROM busybox:1.37.0
RUN dd if=/dev/urandom of=/blob.bin bs=1048576 count=2200 && chmod 0444 /blob.bin
EXPOSE 8080
USER 10001:10001
CMD ["sh", "-c", "echo ok > /tmp/index.html && exec busybox httpd -f -p 8080 -h /tmp"]
