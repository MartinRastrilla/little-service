namespace LittleService.Application.Common;

public static class ServiceRequestPhotoValidator
{
    public const int MaxPhotos = 5;
    public const long MaxFileSizeBytes = 5 * 1024 * 1024;

    private static readonly HashSet<string> AllowedExtensions = new(StringComparer.OrdinalIgnoreCase)
    {
        ".jpg", ".jpeg", ".png", ".webp"
    };

    private static readonly HashSet<string> AllowedContentTypes = new(StringComparer.OrdinalIgnoreCase)
    {
        "image/jpeg", "image/jpg", "image/png", "image/webp"
    };

    public static Result ValidatePhotos(IEnumerable<ServiceRequestPhotoUploadInput> photos)
    {
        var photoList = photos as IReadOnlyList<ServiceRequestPhotoUploadInput> ?? photos.ToList();
        if (photoList.Count > MaxPhotos)
            return Result.Failure($"Se permiten como máximo {MaxPhotos} fotos", "TOO_MANY_PHOTOS");

        foreach (var photo in photoList)
        {
            var extension = Path.GetExtension(photo.FileName);
            if (string.IsNullOrWhiteSpace(extension) ||
                !AllowedExtensions.Contains(extension))
            {
                return Result.Failure(
                    "Solo se permiten imágenes JPG, JPEG, PNG o WebP",
                    "INVALID_PHOTO_TYPE");
            }

            if (!string.IsNullOrWhiteSpace(photo.ContentType) &&
                !AllowedContentTypes.Contains(photo.ContentType))
            {
                return Result.Failure(
                    "Solo se permiten imágenes JPG, JPEG, PNG o WebP",
                    "INVALID_PHOTO_TYPE");
            }

            if (photo.Length > MaxFileSizeBytes)
            {
                return Result.Failure(
                    "Cada imagen no puede superar los 5 MB",
                    "PHOTO_TOO_LARGE");
            }
        }

        return Result.Success();
    }

    public static Result ValidatePhotoCount(int existingCount, int deletedCount, int newCount)
    {
        if (deletedCount < 0 || newCount < 0)
            return Result.Failure("Cantidad de fotos inválida", "INVALID_PHOTO_COUNT");

        if (deletedCount > existingCount)
            return Result.Failure("Una o más fotos a eliminar no existen", "PHOTO_NOT_FOUND");

        var finalCount = existingCount - deletedCount + newCount;
        if (finalCount > MaxPhotos)
        {
            return Result.Failure(
                $"Se permiten como máximo {MaxPhotos} fotos",
                "TOO_MANY_PHOTOS");
        }

        return Result.Success();
    }
}

public class ServiceRequestPhotoUploadInput
{
    public Stream Content { get; set; } = Stream.Null;
    public string FileName { get; set; } = string.Empty;
    public string ContentType { get; set; } = string.Empty;
    public long Length { get; set; }
}
