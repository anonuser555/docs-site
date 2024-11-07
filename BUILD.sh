


BRANCH=$(git branch | awk 'FNR == 1 {print $2}')

URL=$(git remote get-url origin)

echo $URL

IMAGE_PATH=$(python3 <<EOF
import re
matches = re.findall(r'ssh://git@.+?/(.+?).git', '$URL')
print(matches[0])
EOF
)
IMAGE_TAG=registry.gitlab.platform.mcmg-cloud.local/$IMAGE_PATH:$BRANCH

echo $IMAGE_TAG

podman build --format docker -t "$IMAGE_TAG" -f Dockerfile .
podman push --cert-dir /root/ca-certs "$IMAGE_TAG"


