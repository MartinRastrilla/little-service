class ServiceRequestPhotoInput {
  final String path;
  final String fileName;
  final String? mimeType;
  final int length;

  const ServiceRequestPhotoInput({
    required this.path,
    required this.fileName,
    required this.length,
    this.mimeType,
  });
}
