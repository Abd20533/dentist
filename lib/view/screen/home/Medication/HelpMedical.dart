
import 'package:dentist/my_import.dart';

class InfoRowViewMedical extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRowViewMedical({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppMyColor.teal),
          const SizedBox(width: 8),
          Text(
            overflow: TextOverflow.clip,
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppMyColor.black87,
            ),
          ),
          Expanded(
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.clip,
              value,
              style: const TextStyle(

                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppMyColor.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



