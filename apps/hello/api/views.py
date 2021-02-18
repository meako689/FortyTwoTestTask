from rest_framework import views, status
from rest_framework.response import Response


class PingView(views.APIView):
    def get(self, request, **kwargs):
        return Response({'status': True}, status=status.HTTP_200_OK)
