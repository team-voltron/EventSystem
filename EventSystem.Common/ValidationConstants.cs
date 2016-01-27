namespace EventSystem.Common
{
    public class ValidationConstants
    {
        public const int MaxEventName = 100;
        public const int MaxEventDescription = 2000;

        public const int MinCategoryNameLenght = 2;
        public const int MaxCategoryNameLenght = 25;

        public const int MinCommentContentLenght = 1;
        public const int MaxCommentContentLenght = 2500;

        public static string[] AllowedExtensions = new []{ "png", "jpg", "gif", "bmp" };
    }
}
